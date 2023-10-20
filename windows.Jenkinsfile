properties([
  parameters([
    string(
      name: 'REF_BUILD_JOB',
      defaultValue: ''
    ),
    string(
      name: 'REF_BUILD_NUMBER',
      defaultValue: ''
    )
  ])
])

pipeline {
    //agent { label 'built-in' }
    //agent { label 'remote' }
    agent any

    stages {
        stage('Build'){
            steps {
                bat '''mvn process-test-classes jtest:agent test jtest:jtest ^
                           "-Djtest.settings=./localsettings.properties" ^
                           "-Djtest.config=builtin://Unit Tests" ^
                           "-Djtest.report=./build/report/jtest/junit"'''
            }
        }
    }

    post {
        always {
            recordParasoftCoverage coverageQualityGates: [[criticality: 'UNSTABLE', threshold: 80.0, type: 'PROJECT'],
                [criticality: 'UNSTABLE', threshold: 10.0, type: 'MODIFIED_LINES']],
                pattern: 'build/report/jtest/junit/coverage.xml',
                referenceBuild: "${REF_BUILD_NUMBER}", referenceJob: "${REF_BUILD_JOB}"
        }
    }
}
