use clap::{Parser, Subcommand};
use serde::Serialize;
use url::Url;

#[derive(Parser, Debug)]
struct Cli {
    #[command(subcommand)]
    command: Cmd,
}

#[derive(Subcommand, Debug)]
enum Cmd {
    Log { message: String },
}

#[derive(Serialize)]
struct Body<'a> {
    message: &'a String,
    user_id: u64,
}

fn main() {
    let cli = Cli::parse();
    match &cli.command {
        Cmd::Log { message } => {
            let client = reqwest::blocking::Client::new();

            let url: Url = std::env::var("XO_API_URL")
                .expect("XO_API_URL not set")
                .parse()
                .unwrap();

            let url = url.join("posts").unwrap();
            println!("URL: {url:#?}");

            let body = Body {
                message,
                user_id: 2,
            };
            let _ = client.post(url).json(&body).send();
            println!("message logged")
        }
    }
}
