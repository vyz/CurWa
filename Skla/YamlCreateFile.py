import yaml 

d={
"LetterStart": 'L',
"DataBaseForLogoWrite": 'Eb0601',
"NumberStartTable": 1,
"QvoMaxLoadedTables": 10
}
f=open('cfgZapSer.yaml','w')
f.write(yaml.dump(d))
f.close