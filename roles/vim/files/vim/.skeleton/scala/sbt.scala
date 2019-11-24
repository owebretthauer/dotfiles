credentials += Credentials(Path.userHome / ".sbt" / ".credentials")
publishTo := Some("Sonatype Maven Nexus" at "http://172.17.0.2:8081/nexus/content/repositories/releases/")
