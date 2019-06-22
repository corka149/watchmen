%Kazan.Apis.Core.V1.Pod{
  api_version: "v1",
  kind: "Pod",
  metadata: %Kazan.Models.Apimachinery.Meta.V1.ObjectMeta{
    annotations: nil,
    cluster_name: nil,
    creation_timestamp: "2019-06-10T07:15:30Z",
    deletion_grace_period_seconds: nil,
    deletion_timestamp: nil,
    finalizers: nil,
    generate_name: "whoami-deployment-5575b49fcd-",
    generation: nil,
    initializers: nil,
    labels: %{"app" => "whoami", "pod-template-hash" => "5575b49fcd"},
    name: "whoami-deployment-5575b49fcd-r675f",
    namespace: "playground",
    owner_references: [
      %Kazan.Models.Apimachinery.Meta.V1.OwnerReference{
        api_version: "apps/v1",
        block_owner_deletion: true,
        controller: true,
        kind: "ReplicaSet",
        name: "whoami-deployment-5575b49fcd",
        uid: "f2a18a41-8b4e-11e9-8761-080027abe809"
      }
    ],
    resource_version: "60893",
    self_link: "/api/v1/namespaces/playground/pods/whoami-deployment-5575b49fcd-r675f",
    uid: "87df9317-8b4f-11e9-8761-080027abe809"
  },
  spec: %Kazan.Apis.Core.V1.PodSpec{
    active_deadline_seconds: nil,
    affinity: nil,
    automount_service_account_token: nil,
    containers: [
      %Kazan.Apis.Core.V1.Container{
        args: nil,
        command: nil,
        env: nil,
        env_from: nil,
        image: "whoami:1.0.1",
        image_pull_policy: "IfNotPresent",
        lifecycle: nil,
        liveness_probe: %Kazan.Apis.Core.V1.Probe{
          exec: nil,
          failure_threshold: 3,
          http_get: %Kazan.Apis.Core.V1.HTTPGetAction{
            host: nil,
            http_headers: nil,
            path: "/v1/health",
            port: 4000,
            scheme: "HTTP"
          },
          initial_delay_seconds: nil,
          period_seconds: 10,
          success_threshold: 1,
          tcp_socket: nil,
          timeout_seconds: 1
        },
        name: "whoami",
        ports: [
          %Kazan.Apis.Core.V1.ContainerPort{
            container_port: 4000,
            host_ip: nil,
            host_port: nil,
            name: nil,
            protocol: "TCP"
          }
        ],
        readiness_probe: %Kazan.Apis.Core.V1.Probe{
          exec: nil,
          failure_threshold: 3,
          http_get: %Kazan.Apis.Core.V1.HTTPGetAction{
            host: nil,
            http_headers: nil,
            path: "/v1/ready",
            port: 4000,
            scheme: "HTTP"
          },
          initial_delay_seconds: nil,
          period_seconds: 10,
          success_threshold: 1,
          tcp_socket: nil,
          timeout_seconds: 1
        },
        resources: %Kazan.Apis.Core.V1.ResourceRequirements{
          limits: %{"cpu" => "500m", "memory" => "400Mi"},
          requests: %{"cpu" => "200m", "memory" => "100Mi"}
        },
        security_context: nil,
        stdin: nil,
        stdin_once: nil,
        termination_message_path: "/dev/termination-log",
        termination_message_policy: "File",
        tty: nil,
        volume_devices: nil,
        volume_mounts: [
          %Kazan.Apis.Core.V1.VolumeMount{
            mount_path: "/var/run/secrets/kubernetes.io/serviceaccount",
            mount_propagation: nil,
            name: "default-token-lhh49",
            read_only: true,
            sub_path: nil
          }
        ],
        working_dir: nil
      }
    ],
    dns_config: nil,
    dns_policy: "ClusterFirst",
    host_aliases: nil,
    host_ipc: nil,
    host_network: nil,
    host_pid: nil,
    hostname: nil,
    image_pull_secrets: nil,
    init_containers: nil,
    node_name: "minikube",
    node_selector: nil,
    priority: 0,
    priority_class_name: nil,
    readiness_gates: nil,
    restart_policy: "Always",
    scheduler_name: "default-scheduler",
    security_context: %Kazan.Apis.Core.V1.PodSecurityContext{
      fs_group: nil,
      run_as_group: nil,
      run_as_non_root: nil,
      run_as_user: nil,
      se_linux_options: nil,
      supplemental_groups: nil,
      sysctls: nil
    },
    service_account: "default",
    service_account_name: "default",
    share_process_namespace: nil,
    subdomain: nil,
    termination_grace_period_seconds: 30,
    tolerations: [
      %Kazan.Apis.Core.V1.Toleration{
        effect: "NoExecute",
        key: "node.kubernetes.io/not-ready",
        operator: "Exists",
        toleration_seconds: 300,
        value: nil
      },
      %Kazan.Apis.Core.V1.Toleration{
        effect: "NoExecute",
        key: "node.kubernetes.io/unreachable",
        operator: "Exists",
        toleration_seconds: 300,
        value: nil
      }
    ],
    volumes: [
      %Kazan.Apis.Core.V1.Volume{
        aws_elastic_block_store: nil,
        azure_disk: nil,
        azure_file: nil,
        cephfs: nil,
        cinder: nil,
        config_map: nil,
        downward_api: nil,
        empty_dir: nil,
        fc: nil,
        flex_volume: nil,
        flocker: nil,
        gce_persistent_disk: nil,
        git_repo: nil,
        glusterfs: nil,
        host_path: nil,
        iscsi: nil,
        name: "default-token-lhh49",
        ...
      }
    ]
  },
  status: %Kazan.Apis.Core.V1.PodStatus{
    conditions: [
      %Kazan.Apis.Core.V1.PodCondition{
        last_probe_time: nil,
        last_transition_time: "2019-06-10T07:15:31Z",
        message: nil,
        reason: nil,
        status: "True",
        type: "Initialized"
      },
      %Kazan.Apis.Core.V1.PodCondition{
        last_probe_time: nil,
        last_transition_time: "2019-06-10T18:30:51Z",
        message: nil,
        reason: nil,
        status: "True",
        type: "Ready"
      },
      %Kazan.Apis.Core.V1.PodCondition{
        last_probe_time: nil,
        last_transition_time: "2019-06-10T18:30:51Z",
        message: nil,
        reason: nil,
        status: "True",
        type: "ContainersReady"
      },
      %Kazan.Apis.Core.V1.PodCondition{
        last_probe_time: nil,
        last_transition_time: "2019-06-10T07:15:31Z",
        message: nil,
        reason: nil,
        status: "True",
        type: "PodScheduled"
      }
    ],
    container_statuses: [
      %Kazan.Apis.Core.V1.ContainerStatus{
        container_id: "docker://9c617a7b638ec6933144abcfe5594721655979aeb04e076a82e45e1fe20d7436",
        image: "whoami:1.0.1",
        image_id: "docker://sha256:55f6d1e8211a71a8e74ceab50d6aed251af498ad82dcb55bd5abceac6ea17f07",
        last_state: %Kazan.Apis.Core.V1.ContainerState{
          running: nil,
          terminated: %Kazan.Apis.Core.V1.ContainerStateTerminated{
            container_id: "docker://ab2acf5e2df7084c05b7631da705f9f7278c8beb180f225a2368d88c636ce663",
            exit_code: 0,
            finished_at: "2019-06-10T18:30:33Z",
            message: nil,
            reason: "Completed",
            signal: nil,
            started_at: "2019-06-10T18:21:12Z"
          },
          waiting: nil
        },
        name: "whoami",
        ready: true,
        restart_count: 7,
        state: %Kazan.Apis.Core.V1.ContainerState{
          running: %Kazan.Apis.Core.V1.ContainerStateRunning{
            started_at: "2019-06-10T18:30:34Z"
          },
          terminated: nil,
          waiting: nil
        }
      }
    ],
    host_ip: "10.0.2.15",
    init_container_statuses: nil,
    message: nil,
    nominated_node_name: nil,
    phase: "Running",
    pod_ip: "172.17.0.7",
    qos_class: "Burstable",
    reason: nil,
    start_time: "2019-06-10T07:15:31Z"
  }
}
