{
  darktower = {
    deployment.targetHost = "192.168.10.3";
    networking.hostName = "darktower";
    networking.domain = "admin.robot-disco.net";
    imports = [
      ../machines/darktower/hardware-configuration.nix
      ../profiles/hypervisor.nix
      ../profiles/baremetal.nix
      ../profiles/ups.nix
      ../profiles/netdata.nix
#      ../profiles/docker.nix
#      ../profiles/traefik.nix
    ];
  };
  
  network.description = "Gaelan Homelab Baremetal Infra";

  defaults = {
    imports = [
      ../profiles/baseline.nix
      ../profiles/ssh.nix
      ../profiles/users.nix
      ../profiles/mta.nix
    ];
  };
}
