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

    stage('Start image') {
        /* Start the image and wait for approval */

        def container = app.run()
        input "Approve to proceed?"
        if (input == "Proceed") {
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
        } else {
            stage('Remove started image') {
                /* Remove the started image */

                container.stop()
                container.remove(force: true)
            }
        }
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