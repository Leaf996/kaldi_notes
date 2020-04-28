- `awk 'NR==FNR {a[$1]; next} $1 in a {print $1}' file1 file2`
    - [What are NR and FNR and what does “NR==FNR” imply?][1]
    - [awk的NR，FNR，next的用法][2]
- `awk -v val=val`
    - assign val=val
- `awk -F`
    - -F : field separator
- `BEGIN` vs. `END`
    - [awk的流程控制BEGIN和END][3]

[1]:https://stackoverflow.com/questions/32481877/what-are-nr-and-fnr-and-what-does-nr-fnr-imply
[2]:https://blog.csdn.net/xxmonstor/article/details/81327166
[3]:https://blog.51cto.com/151wqooo/1309851