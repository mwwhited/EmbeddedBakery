# https://forums.xilinx.com/t5/Design-Entry/Vivado-automatically-set-working-directory-to-the-current-opened/td-p/706891
# SETS THE WORKING DIRECTORY TO THE PROJECT SO THAT IF YOU GENERATE FILES THEY ARE WRITEN TO THE DIR
set work_directory [get_property DIRECTORY [current_project]] ; cd $work_directory ; puts -nonewline "Changing Directory to " ; pwd