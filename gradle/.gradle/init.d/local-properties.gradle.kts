import java.util.Properties

val localProps = Properties()
val keysToAdd = mutableListOf<String>()

gradle.settingsEvaluated {
    File(rootDir, "local.properties").takeIf { it.exists() }?.inputStream()?.use(localProps::load)
    keysToAdd.addAll(localProps.stringPropertyNames() - startParameter.projectProperties.keys)
    for (key in keysToAdd) {
        extra[key] = localProps.getProperty(key)
    }
}

gradle.rootProject {
    for (key in keysToAdd) {
        extra[key] = localProps.getProperty(key)
    }
}

