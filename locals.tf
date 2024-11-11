locals {
  ssh_opt = {proto="ssh", user_name="admuser", pubkey=file("~/.ssh/id_ed25519.pub"), time="120s"}
}