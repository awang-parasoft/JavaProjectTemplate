#!/usr/bin/env groovy

final DEFAULT_REF_BUILD_JOB = "${env.JOB_NAME}"
final DEFAULT_REF_BUILD_NUMBER = String.valueOf(Integer.parseInt("${env.BUILD_NUMBER}") - 1)

properties([
  parameters([
    string(
      name: 'REF_BUILD_JOB',
      defaultValue: DEFAULT_REF_BUILD_JOB
    ),
    string(
      name: 'REF_BUILD_NUMBER',
      defaultValue: DEFAULT_REF_BUILD_NUMBER
    )
  ])
])

pipeline {
    //agent { label 'built-in' }
    //agent { label 'remote' }
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }

    post {
        always {
            recordParasoftCoverage coverageQualityGates: [[criticality: 'UNSTABLE', threshold: 80.0, type: 'PROJECT'],
                [criticality: 'UNSTABLE', threshold: 10.0, type: 'MODIFIED_LINES']],
                pattern: "build/report/jtest/junit/${BRANCH_NAME}.xml",
                referenceBuild: "${REF_BUILD_NUMBER}", referenceJob: "${REF_BUILD_JOB}"
        }
    }
}
