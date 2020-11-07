// 项目信息
organization := "sysu.seit.311"
name := "my_chisel"
version := "0.1"

// 根据scala版本追加编译选项
def scalacOptionsVersion(scalaVersion: String): Seq[String] = {
  Seq() ++ {
    CrossVersion.partialVersion(scalaVersion) match {
      case Some((2, scalaMajor: Long)) if scalaMajor < 12 => Seq()
      case _ => Seq("-Xsource:2.11")
    }
  }
}
// 根据java版本追加编译选项
def javacOptionsVersion(scalaVersion: String): Seq[String] = {
  Seq() ++ {
    CrossVersion.partialVersion(scalaVersion) match {
      case Some((2, scalaMajor: Long)) if scalaMajor < 12 =>
        Seq("-source", "1.7", "-target", "1.7")
      case _ =>
        Seq("-source", "1.8", "-target", "1.8")
    }
  }
}

scalaVersion := "2.12.10"
crossScalaVersions := Seq("2.12.10", "2.11.12")
// 构成编译选项
scalacOptions ++= Seq("-deprecation", "-feature", "-unchecked", "-language:reflectiveCalls")
scalacOptions ++= scalacOptionsVersion(scalaVersion.value)
javacOptions ++= javacOptionsVersion(scalaVersion.value)
// 构成依赖库
// chisel
val defaultVersions = Seq(
  "chisel-iotesters" -> "1.4.1+"
  )
libraryDependencies ++= defaultVersions.map { case (dep, ver) =>
  "edu.berkeley.cs" %% dep % sys.props.getOrElse(dep + "Version", ver) }
// 数值处理
libraryDependencies += "gov.nist.math" % "jama" % "1.0.3"
libraryDependencies += "org.scalanlp" %% "breeze" % "1.1"

resolvers ++= Seq(
  Resolver.sonatypeRepo("snapshots"),
  Resolver.sonatypeRepo("releases")
)

logBuffered in Test := false

parallelExecution in Test := false

trapExit := false
