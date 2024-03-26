1. Build Docker Image:
   - Open a terminal
   - Navigate to the directory containing the Dockerfile and the application code ("app.py").
   - Run the following command to build the Docker image:
	"docker build -t ex2 ."

2. Run Docker Container:
   - Once the Docker image is built successfully, run the following command to start a Docker container:
	"docker run -d -p 5000:5000 ex2"

3. Test the Application:
   - Open a web browser.
   - Navigate to "http://localhost:5000" to access the running application.
   - In our case the application will provide a text output that will be visible inside the Logs page of the container.