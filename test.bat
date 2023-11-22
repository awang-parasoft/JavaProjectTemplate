mvn jtest:jtest "-Djtest.settings=./localsettings.properties" "-Djtest.config=dtp://DTP Recommended Rules" "-Djtest.report=./build/report/jtest/static"

mvn process-test-classes jtest:agent test jtest:jtest "-Djtest.settings=./localsettings.properties" "-Djtest.config=builtin://Unit Tests" "-Djtest.report=./build/report/jtest/junit"