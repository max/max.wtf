import Head from "next/head";
import Project from "../components/project";
import projects from "../lib/projects";

const isLast = (index, items) => index + 1 === items.length;

export default () => (
  <div className="wrapper center pv4">
    <Head>
      <title>max.dev – Max Schoening</title>
      <meta charset="utf-8" />
      <meta
        name="description"
        content="Max Schoening is a Sr. Product Design Director at GitHub working on planet scale computing for mere mortals."
      />
      <meta name="viewport" content="width=device-width" />

      <link
        rel="stylesheet"
        href="https://unpkg.com/normalize.css@5.0.0/normalize.css"
      />
      <link
        rel="stylesheet"
        href="https://unpkg.com/tachyons@4.6.1/css/tachyons.min.css"
      />
      <link
        rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Roboto+Mono"
      />
    </Head>

    <header className="pv4">
      <img alt="Max Schoening" src="/static/images/logo.svg" />
    </header>

    <div className="mv5 mw6">
      <p>
        Hi,
        <br />
        I&#39;m a product design 🤓 at GitHub working on 🌍 scale computing for
        mere mortals.
      </p>

      <p>
        This one time I made a ☕️ at Google Cloud, ran the product design team
        at <a href="https://www.heroku.com/">Heroku</a>, and founded{" "}
        <a href="https://www.getcloudapp.com/">CloudApp</a>.
      </p>
    </div>

    <div className="mv4">
      {projects.map((project, index) => (
        <div
          className={`project ${!isLast(index, projects) && "mb4"}`}
          key={index}
        >
          <Project project={project} />
        </div>
      ))}
    </div>

    <style jsx>{`
      .wrapper {
        max-width: 1200px;
        padding: 0 2rem;
      }

      .project {
        box-shadow: 0 1px 10px rgba(0, 0, 0, 0.25);
      }
    `}</style>

    <style jsx global>{`
      body {
        background: #222;
        color: #bcbcbc;
        font-family: "Roboto Mono", Menlo, Monaco, monos-space;
        font-size: 1.25rem;
        line-height: 1.5;
      }

      a {
        border-bottom: 2px solid #3a3a3a;
        color: inherit;
        text-decoration: none;
        transition: all 0.2s ease-in-out;
      }

      a:hover,
      a:active {
        border-color: #bcbcbc;
        color: white;
      }
    `}</style>
  </div>
);
