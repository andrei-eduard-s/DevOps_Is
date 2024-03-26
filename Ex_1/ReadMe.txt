To achieve the tasks outlined in the first exercise I have done the following:

1. Install Docker Desktop.
2. Download an Ubuntu image using the docker pull command.
3. Start a container based on the downloaded image using the docker run command:
	"docker run -it --name my_linux_container ubuntu:latest"

4. Create a new user named "john" inside the container:
	"useradd john"
	"mkdir /home/john"
	"chown john:john /home/john"

5. Copy the create_large_file.sh file to the Linux container and execute it:
	"docker cp create_large_file.sh my_linux_container:/create_large_file.sh"

6. I made sure to check the script inside the "create_large_file.sh" file and noticed a bug.

	On line 5: "mv lage_file /home/john" there is a typo, "lage_file" should be "large_file"

	I gave the appropriate permissions: "chmod +x create_large_file.sh"
	I updated the script, editing using "nano create_large_file.sh" and ran it "./create_large_file"

7. Write a bash script that performs the following actions:
	- Prints the home directory.
	- Lists all usernames from the passwd file.
	- Counts the number of users.
	- Finds the home directory of a specific user (prompts for input).
	- Lists users within a specific UID range.
	- Finds users with standard shells like /bin/bash or /bin/sh.
	- Replaces the "/" character with "" character in the entire /etc/passwd file and redirects the content to a new file.
	- Prints the private IP.
	- Prints the public IP.
	- Switches to the "john" user and prints the home directory.
	- Implement error handling to check for appropriate privileges and exit gracefully with informative messages if not.
	- Use a function for each request in the script.
	- Ensure proper execution of each step, considering error handling and privilege management.
7. I ran the script using the following command:
	"./script.sh /etc/passwd"

8. I checked the passwdnew file to see the output from the "replace_characters_in_passwd()" function.
9. I copied the script.sh, passwdnew and /etc/passwd files from my_linux_container to a local folder on my pc:
	"(base) PS C:\Users\andre\Desktop\Tremend> docker cp my_linux_container:/script.sh 1"
	"(base) PS C:\Users\andre\Desktop\Tremend> docker cp my_linux_container:/passwdnew 1"
	"(base) PS C:\Users\andre\Desktop\Tremend> docker cp my_linux_container:/etc/passwd 1"
