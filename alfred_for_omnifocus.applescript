set new_task to "Testing 123 @calls"

tell application "OmniFocus"
	if it is not running then
		activate
	end if
	parse tasks into default document with transport text new_task
	
end tell

set the_offset to offset of "@" in new_task

if the_offset is 0 then
	display notification "Created the new task: " & new_task
else
	set task_name to text 1 thru (the_offset - 1) of new_task
	set context_name to text (the_offset + 1) thru -1 of new_task
	display notification "Created the new task: \r" & task_name & " within the @" & context_name & " Context"
end if

