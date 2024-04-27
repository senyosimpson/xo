use std::collections::HashMap;

use clap::{Parser, Subcommand};

#[derive(Parser, Debug)]
struct Cli {
    #[command(subcommand)]
    command: Cmd,
}

#[derive(Subcommand, Debug)]
enum Cmd {
    Log { message: String },
}

fn main() {
    let cli = Cli::parse();
    match &cli.command {
        Cmd::Log { message } => {
            let client = reqwest::blocking::Client::new();

            let mut body = HashMap::with_capacity(2);
            body.insert("message", message);

            let url = std::env::var("XO_API_URL").expect("XO_API_URL not set");

            let _ = client.post(url).json(&body).send();
            println!("message logged")
        }
    }
}
