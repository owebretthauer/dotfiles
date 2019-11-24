package shell
import org.springframework.shell.standard.{ShellComponent, ShellMethod}

import com.softwaremill.sttp._
import org.jsoup.Jsoup
import org.jsoup.nodes._

@ShellComponent
class <<++>> {

  @ShellMethod(value = "<<++>>")
  def execute(url: String): String = {

    TrustAllCerts()
    implicit val backend = HttpURLConnectionBackend(
      //options = SttpBackendOptions.httpProxy("localhost", 8080)
    )

    val request = sttp.get(uri"$url")
    val header = Map(
      "User-Agent" -> "Mozilla/5.0 (X11; Linux x86_64; rv:65.0) Gecko/20100101 Firefox/65.0"
    )

    val response = request
      .headers(header)
      .send()

    for {
      body <- response.body
      doc = Jsoup.parse(body)
    } {
      println(doc)
    }

    ""
  }
}
