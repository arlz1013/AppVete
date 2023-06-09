from fastapi import FastAPI; from pydantic import BaseModel
import sql; bd = sql.SQL(); 
import con; my = con.MYSQL()
import json

app = FastAPI()

@app.get("/")
async def read_root():
    data = [True]
    return data


@app.get("/SQL/show/")
async def Show():
    send = (bd._Show_So_All())
    return json.dumps(send)


@app.post("/SQL/show/")
async def ShowSelect(ide : int, col : str, sel : bool):
    send  = bd._Show_So(col, ide, sel)
    return json.dumps(send)

@app.post("/SQL/add")
async def Add(name : str, TpUser : str):
    send = bd._Insert(name, TpUser)
    return json.dumps(send)

#---------- MYSQL

@app.get("/my/show/")
async def Show():
    send = (my._Seletc_all())
    return json.dumps(send)


@app.post("/my/show/")
async def ShowSelect(ide : str):
    send  = my._Seletc(ide)
    return json.dumps(send)

@app.post("/my/add")
async def Add(name : str, TpUser : str):
    send = my._Insert(b = name, a =TpUser)
    return json.dumps(send)


"""
@app.put("SQL/Upd")
async def Update(clm : str , vl : str, ide: str, x : bool):
    send  = bd._Update(clm, vl, ide, x)
    return send

@app.put("SQL/del")
async def Delete(ide : str ):
    send = bd._Delete(ide)
    return send
"""