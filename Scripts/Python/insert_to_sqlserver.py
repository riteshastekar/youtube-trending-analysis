import kagglehub
import pandas as pd 
import os
import json
import pyodbc



# Download latest version
path = kagglehub.dataset_download("datasnaek/youtube-new")
#list directorys in ths the path
dirinfile = os.listdir(path)


# seprates all csv and json files in the directorys
all_csv = [files.strip() for files in dirinfile if '.csv' in files]

all_json = [files.strip() for files in dirinfile if '.json' in files]

country_v_data =  {}
category_dfs = {}

for all_c in all_csv:
    country_code = all_c[:8]
    try:
        country_v_data[country_code] = pd.read_csv(
            os.path.join(path, all_c), encoding="utf-8"
        )
    except UnicodeDecodeError:
        country_v_data[country_code] = pd.read_csv(
            os.path.join(path, all_c), encoding="latin-1"
        )




for all_j in all_json:
    category_code = all_j[:2]
    with open(os.path.join(path, all_j), "r", encoding="utf-8") as f:
        items = json.load(f)["items"]
    category_dfs[category_code] = pd.DataFrame(
        [{"id": i["id"], "title": i["snippet"]["title"]} for i in items]
        )
# ---------------------------------------------------------------------------
# Fix mojibake in JP/KR/RU video CSVs

def fix_mojibake(df: pd.DataFrame) -> pd.DataFrame:
    """Reverse UTF-8 text that was mis-written as Latin-1/cp1252 in the source CSV."""
    for col in df.select_dtypes(include="object").columns:
        df[col] = df[col].apply(
            lambda x: x.encode("latin1", errors="replace").decode("utf-8", errors="replace")
            if isinstance(x, str) else x
        )
    return df


for code in ("JPvideos", "KRvideos", "RUvideos"):
    if code in country_v_data:
        country_v_data[code] = fix_mojibake(country_v_data[code])
        


Canada_df = country_v_data.get('CAvideos')
Germany_df = country_v_data.get('DEvideos')
France_df =  country_v_data.get('FRvideos')
Great_Britain_df = country_v_data.get('GBvideos')
India_df = country_v_data.get('INvideos')
Japan_df = country_v_data.get('JPvideos')
South_Korea_df = country_v_data.get('KRvideos')
Mexico_df = country_v_data.get('MXvideos')
Russia_df = country_v_data.get('RUvideos')
Usa_df =country_v_data.get('USvideos')
Canada_category_df = category_dfs.get("CA")
Germany_category_df = category_dfs.get("DE")
France_category_df = category_dfs.get("FR")
Great_Britain_category_df = category_dfs.get("GB")
India_category_df = category_dfs.get("IN")
Japan_category_df = category_dfs.get("JP")
South_Korea_category_df = category_dfs.get("KR")
Mexico_category_df = category_dfs.get("MX")
Russia_category_df = category_dfs.get("RU")
Usa_category_df = category_dfs.get("US")



#-----------------------------------------inserting data into sql server----------------------------------------------

#---------- FIRST CREATE DATABASE AND TABLE USING SCRIPTS IN SQL AND INSERT YOUR DATA BASE AND SERVER NAME HERE
conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    r"SERVER=YOUR SERVERNAME;"
    "DATABASE=DATABASE NAME;"
    "Trusted_Connection=yes;"
)
#-----------------------------------------------------------------------------------------------------------------------
 
conn = pyodbc.connect(conn_str)
if conn is None:
        print("FAILED TO CONNECT TO THE SERVER CHECK THE SERVERNAME OR DATABASE CREATED")
else:
        print("CONNECTED TO THE SERVER SUCCESFULLY")
        print("THIS WILL TAKE A WHILE")
cursor = conn.cursor()
cursor.fast_executemany = True  



def insert_df(df: pd.DataFrame, table_name: str, cursor, conn, batch_size: int = 1000):
    """Insert a DataFrame into an existing SQL Server table in batches."""
    if df is None or df.empty:
        print(f"Skipped {table_name}: DataFrame is None or empty")
        return
    else:
        cursor.execute(f"TRUNCATE TABLE {table_name};")
        conn.commit()

    cols = ", ".join(f"[{c}]" for c in df.columns)
    placeholders = ", ".join("?" for _ in df.columns)
    sql = f"INSERT INTO [{table_name}] ({cols}) VALUES ({placeholders})"

    # Convert every value to a plain Python type pyodbc understands.
    
    def to_native(v):
        if pd.isna(v):
            return None
        if hasattr(v, "item"):   # numpy.int64, numpy.float64, numpy.bool_, etc.
            return v.item()
        return v

    data = [
        [to_native(v) for v in row]
        for row in df.itertuples(index=False, name=None)
    ]

    try:
        for i in range(0, len(data), batch_size):
            batch = data[i:i + batch_size]
            cursor.executemany(sql, batch)
            conn.commit()
        print(f"Inserted {len(data)} rows into {table_name}")
    except pyodbc.Error as e:
        conn.rollback()
        print(f"Failed inserting into {table_name}: {e}")



video_tables = {
    "CAvideos": Canada_df,
    "DEvideos": Germany_df,
    "FRvideos": France_df,
    "GBvideos": Great_Britain_df,
    "INvideos": India_df,
    "JPvideos": Japan_df,
    "KRvideos": South_Korea_df,
    "MXvideos": Mexico_df,
    "RUvideos": Russia_df,
    "USvideos": Usa_df,
}

category_tables = {
    "CA_category": Canada_category_df,
    "DE_category": Germany_category_df,
    "FR_category": France_category_df,
    "GB_category": Great_Britain_category_df,
    "IN_category": India_category_df,
    "JP_category": Japan_category_df,
    "KR_category": South_Korea_category_df,
    "MX_category": Mexico_category_df,
    "RU_category": Russia_category_df,
    "US_category": Usa_category_df,
}



if __name__ == "__main__":
    for table_name, df in video_tables.items():
        insert_df(df, table_name, cursor, conn)

    for table_name, df in category_tables.items():
        insert_df(df, table_name, cursor, conn)

    cursor.close()
    conn.close()
    print("Done.")
