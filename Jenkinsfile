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
        /* This stage creates the docker-compose file */
        
        sh 'echo "version: \'3\'" > docker-compose.yml'
        sh 'echo "services:" >> docker-compose.yml'
        sh 'echo "  app:" >> docker-compose.yml'
        sh 'echo "    image: ssh/ssh" >> docker-compose.yml'
        sh 'echo "    container_name: ssh" >> docker-compose.yml'
        sh 'echo "    hostname: ssh" >> docker-compose.yml'
        sh 'echo "    ports:" >> docker-compose.yml'
        sh 'echo "      - 2222:2222" >> docker-compose.yml'
        sh 'echo "    volumes:" >> docker-compose.yml'
        sh 'echo "      - /mnt/docker/ssh_cm-home:/root/cm" >> docker-compose.yml'
        sh 'echo "    environment:" >> docker-compose.yml'
        sh 'echo "      - TZ=Europe/Amsterdam" >> docker-compose.yml'
    }

    stage('Execute docker-compose up') {
        /* This stage executes the docker-compose file */

        sh 'docker-compose up -d'
    }

    stage('Testing') {
        /* This stage requires manual approval before deploying to production */

        input "Testing done?"
    }

    stage('Execute docker-compose down') {
        /* This stage executes the docker-compose file */

        sh 'docker-compose down'
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