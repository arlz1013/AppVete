import sqlite3 as sql
import os , sys, json

class SQL:
    def __init__(self) -> None:
        db = "../sql/DTBS.db"
        exe = os.path.exists(db)
        try:    
            self.conn = sql.connect(db)
            self.cur = self.conn.cursor()
            #self.cur.execute(".mode json")
            if exe == False:
                self.cur.execute("""
                    create table User
                    (id integer primary key autoincrement, name text, TpUser int);
                            """)
                self.cur.execute("Insert into User (name , TpUser) values ('admin', 1)")
                self.conn.commit()
        except self.conn.Error as err:
            print("Error with Connection with BaseData" ); print(err)
            self.conn.close()
            
        else:
            print("Succesful DataBase Create")
    def _Insert(self, a, b):
        try:
            self.cur.execute(
                f"""
                    Insert into User (name, TpUser) values ('{a}', {b});
                """)
            self.conn.commit()
        except self.conn.Error as err:
            print("Error Insert Values"); print(err)
        
        else:
            return "Datas Insertadas"

    def _Show_So_All(self):
        try:
            self.cur.execute(
                f"""
                Select * from User
                """)    
            rows = self.cur.fetchall()
        except self.conn.Error as err:
            print("Error To Show"); print(err)
        else:
            return rows
            
            
    def _Show_So(self, a, b, c):
        if c == True:
            bd = f"""
                    Select * from User where {a} = {b};
                """
        else: 
            bd = f"""
                    Select * from User where {a} = '{b}';
            """
        try:
            self.cur.execute(bd)       
            rows = self.cur.fetchall()
        except self.conn.Error as err:
            print("Error To Show"); print(err)
        else:
            return rows
    
    def _Delete(self, a):
        try:
            self.cur.execute(
                f"""
                Delete from User where id = {a}
                """)
            self.conn.commit()
        except self.conn.Error as err:
            print("Error to Delete"); print(err)
        else:
            return "Datas Eliminadas"
    
    def _Update(self, clm, vl, ide, x):
        if x == True:
            bd = f"""
                    Update User set {clm} = {vl} where id = {ide};
                 """
        else:
            bd = f"""
                    Update User set {clm} = '{vl}' where id = {ide};
                """
        try:
            self.cur.execute(bd)       
            self.conn.commit()
        except self.conn.Error as err:
            print("Error To Show"); print(err)
        else:
            return "Update"


data = SQL()
print(json.dumps(data._Show_So_All()))