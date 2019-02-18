load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")

def gateway_grpc_library(**kwargs):
    compilers = kwargs.pop("compilers", [
        "@io_bazel_rules_go//proto:go_grpc",
        "@grpc_ecosystem_grpc_gateway//protoc-gen-grpc-gateway:go_gen_grpc_gateway",
    ])
    deps = kwargs.pop("deps", [])

    go_proto_library(
        compilers = compilers,
        deps = ["@go_googleapis//google/api:annotations_go_proto"] + deps,
        **kwargs
    )
