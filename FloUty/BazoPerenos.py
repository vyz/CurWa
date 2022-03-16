from pathlib import Path


fro = Path(r'C:\ProgramData\Sprut Technology\SprutOKP6\database\LOPO')
toma = Path(r'D:\okpo\Bases\O642')
toma.mkdir() 
for flo in fro.iterdir():
    s = flo.stat()
    leno = len(s)
    flo.rename(toma)