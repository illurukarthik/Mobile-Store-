pipeline {
    environment{
        registry="kkrilluru/mobilestore_01"
        registryCredential="dockerrepo"
        dockerImage=''
        
    }
  
  agent any
 
   
  stages {
       stage('build'){
           steps{
               echo 'building the project'
               bat 'mvn clean install'
               }
          
       }
  }
}
