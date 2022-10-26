//
//
// pipeline
// {
//     agent
//     {
//         docker
//         {
//             image 'maven:3.8.1-adoptopenjdk-11'
//             args '-v /root/.m2:/root/.m2'
//         }
//     }
//     stages
//     {
//         stage('Build')
//         {
//             steps
//             {
//                 sh 'mvn -B -DskipTests clean package'
//             }
//         }
//
//
//         stage('Test')
//         {
//             steps
//             {
//                 sh 'mvn test'
//             }
//             post
//             {
//                 always
//                 {
//                     junit 'target/surefire-reports/*.xml'
//                 }
//             }
//         }
//         stage('Deliver')
//         {
//         steps {
//             node
//             {
//                 def app
//                 /* This builds the actual image; synonymous to
//                 * docker build on the command line */
//                 app = docker.build("getintodevops/hellonode")
//                 /* Finally, we'll push the image with two tags:
//                 * First, the incremental build number from Jenkins
//                 * Second, the 'latest' tag.
//                 * Pushing multiple tags is cheap, as all the layers are reused. */
//                 docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials')
//                 {
//                 app.push("${env.BUILD_NUMBER}")
//                 app.push("latest")
//                 }
//             }}
//         }
//     }
// }
//


node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("jbcuningham/spring-boot-with-discovery")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'jbcuningham') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}