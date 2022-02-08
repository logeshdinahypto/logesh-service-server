rootProject.name = "logesh-service-server"

include("logesh-service-models", "logesh-service-server")

pluginManagement {
    repositories {
        gradlePluginPortal()
        mavenCentral()
        google()
    }
}
