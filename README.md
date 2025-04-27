This is a simple bash script that works like a small version of grep.

You can search for words inside a text file.

How to use

./mygrep.sh [options] search_string filename
search_string → the word you want to find

filename → the file you want to search in

Options
-n → show line numbers

-v → show lines that don't match

you can combine them like -vn or -nv

--help → show how to use it

Notes:

1-The search doesn't care about big or small letters (case-insensitive).

2-If the file doesn't exist, it will give an error.

3-If you use --help, it will show you how to use the script.

That's it.
Nothing complicated.
Just a simple search tool.
