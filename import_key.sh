#!/bin/bash

KEY_NAME="bcitkey"
PUBLIC_KEY_FILE="$HOME/.ssh/bcitkey.pub"

if [ ! -f "$PUBLIC_KEY_FILE" ]; then
	echo "Error: Public key file '$PUBLIC_KEY_FILE' does not exist."
	exit 1
fi

echo "Importing public key into AWS with name: $KEY_NAME"
aws ec2 import-key-pair \
	--key-name "$KEY_NAME" \
	--public-key-material fileb://$PUBLIC_KEY_FILE \
	--output text
echo "Public key imported successfully as '$KEY_NAME'."
