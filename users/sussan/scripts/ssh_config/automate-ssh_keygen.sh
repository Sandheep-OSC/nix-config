# Define an array of key configurations
declare -A key_configs
key_configs=(
  ["budtut143@gmail.com"]="$HOME/.ssh/id_ed25519_budtut143"
  ["spp26041999@gmail.com"]="$HOME/.ssh/id_ed25519_spp26041999"
  ["webappdevelop8@gmail.com"]="$HOME/.ssh/id_ed25519_webappdevelop8"
  ["sandeep@webknot.com"]="$HOME/.ssh/id_ed25519_webknot"
  ["sussan.osc@gmail.com"]="$HOME/.ssh/id_ed25519_osc"
)

# Iterate over the key configurations
for email in "${!key_configs[@]}"; do
  key_path=${key_configs[$email]}
  echo "$key_path $email"

  # echo "Generating a new SSH key pair for $email..."
  #
  # # Generate the SSH key pair using ed25519
  # ssh-keygen -t ed25519 -C "$email" -f "$key_path" -N ""
  #
  # # Add the new key to the ssh-agent
  # echo "Adding the SSH key to the ssh-agent..."
  # eval "$(ssh-agent -s)"
  # ssh-add "$key_path"
  #
  # # Print the public key
  # echo "Your public key for $email is:"
  # cat "${key_path}.pub"
  #
  # # Instructions for the user to add the key to GitHub
  # echo "To add the SSH key to your GitHub account, follow these steps:"
  # echo "1. Copy the public key to your clipboard: cat ${key_path}.pub | pbcopy (for macOS) or cat ${key_path}.pub | xclip -sel clip (for Linux)"
  # echo "2. Go to GitHub.com, log in, and navigate to Settings > SSH and GPG keys."
  # echo "3. Click 'New SSH key', give it a title, and paste your key into the 'Key' field."
  # echo "4. Click 'Add SSH key'."
  #
  # echo "Done for $email!"
  # echo "--------------------------------------"
done

echo "All keys generated and configured!"
