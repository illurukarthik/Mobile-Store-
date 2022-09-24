pipeline {
    environment{
        registry="kkrilluru/mobilestore_01"
        registryCredential="dockerrepo"
        dockerImage=''
        
    }
  
  agent any
 
   
  stages {
       stage('Gitlab'){               
                steps{
                    git branch: 'main', credentialsId: 'gitrepo', url: 'https://github.com/illurukarthik/Mobile-Store-.git'
            }
        }
       stage('build'){
           steps{
               echo 'building the project'
               sh 'mvn clean install'
               }
          
       }
       
       stage('Build stage'){
           steps{
               echo "Building docker image"
                script{
                  dockerImage=docker.build registry + ":$BUILD_NUMBER"
                }
               }
       }
	   stage('Push docker image'){
	       steps{
	           echo "Pushing docker image"
	           script{
	               docker.withRegistry('',registryCredential){
	                   dockerImage.push()
	                   dockerImage.push('latest')
	                   }
	               }
	           }
	       }
	   
         stage('deployement'){
           steps{
               echo "deploy to dev stage"
                script{  
				  sh 'docker rm -f mobilestore || true'
                  sh 'docker run -d -p 8099:8099 --name=mobilestore mobilestore:latest'
                }
               }  
       }
  }
}
