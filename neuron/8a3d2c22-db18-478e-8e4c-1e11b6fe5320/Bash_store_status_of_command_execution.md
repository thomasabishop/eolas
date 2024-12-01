---
tags: [shell, AWS, S3]
created: Sunday, November 17, 2024
---

# Bash store status of command execution

We can store the outcome of a command in a variable, then check this variable to
derive the status and then provide custom outputs or other branching logic.

Here is an example of adding an object to a bucket in S3:

```bash
aws s3api put-object --bucket "${BUCKET_NAME}" --key "${FILE}" --body "${FILE_PATH}" >/dev/null 2>&1
STATUS=$?

if [ $STATUS -eq 0 ]; then
	echo -e "SUCCESS File uploaded."
else
	echo -e "Upload failed with status $STATUS."
fi
```
