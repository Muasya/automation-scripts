
#!/bin/sh

# A docker packaging script
# Author: Muasya.J.Muli 2022


# Highligh the usage of the script
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Usage: ./build.sh [OPTION]"
    echo "Options:"
    echo "  -h, --help    Display this help message"
    echo "  -d, --dir     The directory of the project to build"
    echo "  -n, --name    The name of the project to build"
    echo "  -v, --version The version of the project to build"
    echo "  -i, --image   The name of the docker image to build"
    echo "  -p, --push    The name of the docker image to push"
    exit 1
fi


# Check if the docker image is already built
if [ -f ./Dockerfile ]; then
    echo "Dockerfile image already exists, skipping build"
    # then exit
    exit 0
else
    echo "Dockerfile not found, Building image"

    # Ask the directory of the project to build
    echo "Enter the directory of the project to build"
    read -r project_dir

    # Check if the directory is valid
    if [ -d "$project_dir" ]; then
        echo "Directory found"

        # Ask the name of the project to build or use the directory name if not specified
        echo "Enter the name of the project"
        read -r project_name || project_name=$(basename "$project_dir")

        # Ask the version of the project to build or use 1.0.0 if not specified
        echo "Enter the version of the project"
        read -r project_version || project_version="1.0.0"

        # Check the directory of the project to build to determine the programming language of the project
        # If the directory contains any .py file, the project is Python
        # If the directory contains any .go file, the project is Go
        # If the directory contains any .js file, the project is node  
        # If the directory contains any .sh file, the project is bash
        # If the directory contains any .rb file, the project is ruby
        # If the directory contains any .php file, the project is php
        # If the directory contains any .java file, the project is java
        # If the directory contains any .c file, the project is c
        # If the directory contains any .cpp file, the project is cpp
        # If the directory contains any .h file, the project is cpp
        # If the directory contains any .cs file, the project is csharp
        # If the directory contains any .swift file, the project is swift
        # If the directory contains any .scala file, the project is scala
        # If the directory contains any .rs file, the project is rust

        if [ -f "$project_dir"/*.py ]; then
            echo "Project is Python"
            project_language="python"
        elif [ -f "$project_dir"/*.go ]; then
            echo "Project is Go"
            project_language="go"
        elif [ -f "$project_dir"/*.js ]; then
            echo "Project is Node"
            project_language="node"
        elif [ -f "$project_dir"/*.sh ]; then
            echo "Project is Bash"
            project_language="bash"
        elif [ -f "$project_dir"/*.rb ]; then
            echo "Project is Ruby"
            project_language="ruby"
        elif [ -f "$project_dir"/*.php ]; then
            echo "Project is PHP"
            project_language="php"
        elif [ -f "$project_dir"/*.java ]; then
            echo "Project is Java"
            project_language="java"
        elif [ -f "$project_dir"/*.c ]; then
            echo "Project is C"
            project_language="c"
        elif [ -f "$project_dir"/*.cpp ]; then
            echo "Project is C++"
            project_language="cpp"
        elif [ -f "$project_dir"/*.h ]; then
            echo "Project is C++"
            project_language="cpp"
        elif [ -f "$project_dir"/*.cs ]; then
            echo "Project is C#"
            project_language="csharp"
        elif [ -f "$project_dir"/*.swift ]; then
            echo "Project is Swift"
            project_language="swift"
        elif [ -f "$project_dir"/*.scala ]; then
            echo "Project is Scala"
            project_language="scala"
        elif [ -f "$project_dir"/*.rs ]; then
            echo "Project is Rust"
            project_language="rust"
        else
            echo "Project is unknown"
            project_language="unknown"
        fi

        # Tell the user the language of the project and ask if they want to continue or change the language
        echo "The project is written in $project_language"
        echo "Do you want to continue with the language? (y/n)"
        read -r continue_language
        # If the user wants to continue with the language, continue
        if [ "$continue_language" = "y" ]; then
            echo "Continuing with the language"
        # If the user wants to change the language, ask for the new language
        elif [ "$continue_language" = "n" ]; then
            echo "Enter the new language"
            read -r project_language
        fi



        # Add a dockerfile for the project at the root of the project if not already present
        if [ -f "$project_dir/Dockerfile" ]; then
            echo "Dockerfile found"
        else
            echo "Proceeding to create Dockerfile"
            echo "Creating Dockerfile"
            cp Dockerfile $project_dir
        

            # add a build script for the project
            
            echo "Adding build script for the project"
            echo "Creating build.sh"
            echo "#!/bin/sh" > $project_dir/build.sh
            echo "docker build -t $project_name:$project_version ." >> $project_dir/build.sh
            echo "docker tag $project_name:$project_version $project_name:latest" >> $project_dir/build.sh
            echo "docker push $project_name:$project_version" >> $project_dir/build.sh
            echo "docker push $project_name:latest" >> $project_dir/build.sh
            chmod +x $project_dir/build.sh

            

            # Look at the project directory and dependin on the programming language, read the requirements and dependencies and add them to the Dockerfile
            if [ "$project_language" = "python" ]; then
                echo "Python found"
                if [ -f "$project_dir/requirements.txt" ]; then
                    echo "requirements.txt found"
                    echo "Adding requirements to Dockerfile"
                    echo "RUN pip install -r requirements.txt" >> $project_dir/Dockerfile
                else
                    echo "requirements.txt not found"
                fi
                if [ -f "$project_dir/requirements-dev.txt" ]; then
                    echo "requirements-dev.txt found"
                    echo "Adding requirements-dev to Dockerfile"
                    echo "RUN pip install -r requirements-dev.txt" >> $project_dir/Dockerfile
                else
                    echo "requirements-dev.txt not found"
                fi
            elif [ "$project_language" = "node" ]; then
                echo "Node found"
                if [ -f "$project_dir/package.json" ]; then
                    echo "package.json found"
                    echo "Adding dependencies to Dockerfile"
                    echo "RUN npm install" >> $project_dir/Dockerfile
                else
                    echo "package.json not found"
                fi
                if [ -f "$project_dir/package-lock.json" ]; then
                    echo "package-lock.json found"
                    echo "Adding dependencies to Dockerfile"
                    echo "RUN npm install" >> $project_dir/Dockerfile
                else
                    echo "package-lock.json not found"
                fi
            elif [ "$project_language" = "java" ]; then
                echo "Java found"
                if [ -f "$project_dir/pom.xml" ]; then
                    echo "pom.xml found"
                    echo "Adding dependencies to Dockerfile"
                    echo "RUN mvn install" >> $project_dir/Dockerfile
                else
                    echo "pom.xml not found"
                fi
            fi


            # Ask the name of the docker image to build
            echo "Enter the name of the docker image to build"
            read -r docker_image_name

            # Ask the name of the docker image to push
            echo "Enter the name of the docker image to push"
            read -r docker_image_push_name

            # Build the docker image
            echo "Building the docker image"
            docker build -t $docker_image_name:$project_version $project_dir

            # Push the docker image
            echo "Pushing the docker image"
            docker push $docker_image_push_name:$project_version

        fi

        
    fi


fi
    




