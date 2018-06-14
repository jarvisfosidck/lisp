##jarvis fosdick
##July 27, 2007
##for items in directory and subdirectories

def foreach_file_in_dir(path):
    for d in path:
        if os.path.isdir(os.path.join(path, d)):
            foreach_file_in_dir(os.path.join(path, d))
        elif os.path.isfile(os.path.join(path, d)):
            do_function(os.path.join(path, d))

            
