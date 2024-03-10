node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("ssh/ssh")
    }

    stage('Create docker-compose file') {
        /* This stage creates a script */
    
        sh 'echo cat <<EOF > docker-compose.yml'
        sh 'echo version: '3''
        sh 'echo services:'
        sh 'echo   ssh:'
        sh 'echo     image: ssh:latest'
        sh 'echo     container_name: ssh'
        sh 'echo     hostname: ssh'
        sh 'echo     ports:'
        sh 'echo       - 2222:2222'
        sh 'echo     networks:'
        sh 'echo       backend:'
        sh 'echo         ipv4_address: 10.6.0.4'
        sh 'echo     volumes:'
        sh 'echo       - /mnt/docker/ssh_cm-home:/root/cm'
        sh 'echo     environment:'
        sh 'echo       - TZ=Europe/Amsterdam'
        sh 'echo EOF'
        sh 'touch docker-compose.sh'
        sh 'echo "Script created!"'
    }

    stage('Execute script') {
        /* This stage executes a script */
    
        sh 'chmod +x ./docker-compose.sh' // Give execute permission to the script file
        sh './docker-compose.sh' // Modify the command to include the correct file path
    }

    stage('Approval to Prod') {
        /* This stage requires manual approval before deploying to production */

        input "Deploy to production?"
    }

    stage('Push image to prod registry') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://cm-prod-boz-001.tail118e1.ts.net') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}