# CMSC216-Autograder

#### Description
This is my bash script to automate the public and student unit tests in CMSC216 (computer systems) in my sophomore year at the University of Maryland, College Park.
#### How it works
The way it works is by using wildcards to pick out "public01.c" and "student01.c" formatted test names from the current working directory. It then compiles them with the main C project file. Then, it runs the diff command with output redirection on the executable file and the corresponding "public01.output" and "student01.output" formatted files, returning the result. Finally, based on the result it'll tell you the test name, its status, and give it some color in the terminal.
#### For the future
Since we receive a new project each week of the semester, it would be neat to adjust the script to automatically pick out the main C file and its linking dependencies, or maybe use flags in executing the script to input them. Regardless, it's currently equally satisfying and useful to see your tests fail/pass.
#### Sample output
Here's some sample showing pass/fail/compilation error. Pretty nifty.
![](https://github.com/nick-thoennes/cmsc216-autograder/blob/main/sample_output.png)
