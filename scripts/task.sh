output_file=$HOME/scripts/.bashrc.d/task_contexts.bash
echo "alias context='clear && task context'" > $output_file
echo "alias none='task context none'" >> $output_file
while read -r line; do
	is_context=$(echo $line | sed 's/\..*//')
	if [ "$is_context" == "context" ]; then
		context=$(echo ${line#*context.} | sed 's/=.*//')
		command="alias $context='clear && task context $context && task'"
		echo $command >> $output_file
	fi
done < $TASKRC
