fn main() {
    ::capnpc::CompilerCommand::new()
        .file("schema.capnp")
        .run()
        .expect("compiling schema");
}