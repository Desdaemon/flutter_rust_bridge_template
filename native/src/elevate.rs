use sudo;
use polkit;
use std::process::Command;

fn main() {
    let command = "ls -la /root/";

    if polkit::is_available() {
        let result = sudo::run(command);

        println!("{:?}", result);
    } else {
        let output = Command::new("sudo")
            .arg(command)
            .output()
            .expect("Failed to run sudo");

        println!("{}", String::from_utf8_lossy(&output.stdout));
    }
}
