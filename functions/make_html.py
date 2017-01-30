#!/usr/bin/env python

# This is a little python script to render results into a template

import sys
import os
from glob import glob

# The input is the folder with results .html files
# The results index.html and template.html are also assumed here
folder = sys.argv[1]

output_file = "%s/index.html" %(folder)
template_file = "%s/template.html" %(folder)
sub = "[[RESULTS]]"

results_files = glob("%s/*.html" %(folder))
results_files.sort()

replacement = ""
for results_file in results_files:
    relative_path = os.path.basename(results_file)
    if relative_path != "template.html":
        replacement = "%s\n<li><a href='%s'>%s</a></li>" %(replacement,
                                                           relative_path,
                                                           relative_path)
with open(template_file,'r') as filey:
    content = filey.read()

content = content.replace(sub,replacement)

with open(output_file,'w') as filey:
    filey.writelines(content)
