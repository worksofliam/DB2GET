# DB2GET
Use DB2 to download files from the web. This was made since I didn't have access to WGET or CURL on the system I use.  It is used to download one file at a time.

## Build

You can build this using [Relic](https://github.com/Club-Seiden/RelicPackageManager/): 

`RELICGET PLOC('https://github.com/WorksOfBarry/DB2GET/archive/master.zip') PDIR('DB2GET-master') PNAME(SOMELIB)`

## Usage

DB2GET takes two parameters.

1. Direct link to file
2. IFS path to file to create (or overwrite)

```
//Download into current directory
DB2GET PLOC('http://pastebin.com/raw/UBBfawt9') PPTH(SOMETEST.TXT)

//Download into IFS root
DB2GET PLOC('http://pastebin.com/raw/UBBfawt9') PPTH('/sometest.txt')
```
