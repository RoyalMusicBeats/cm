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

    stage('Create scripts') {
        /* This stage creates a script */
    
        sh 'echo "Creating script..."'
        sh 'touch your_script.sh'
        sh 'echo "Script created!"'
    }

    stage('Execute script') {
        /* This stage executes a script */
    
        sh './your_script.sh' // Modify the command to include the file path
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