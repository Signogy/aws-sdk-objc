import datetime
import sys

from functions import log, run_command

distribution_id = sys.argv[1]
path = sys.argv[2]
invalidation = '{{"Paths":{{"Quantity":1,"Items":["/{0}"]}},"CallerReference":"{0}{1}"}}'.format(
    path, datetime.datetime.now()
)

exit_code, out, err = run_command(["aws", "configure", "set", "preview.cloudfront", "true"])
if exit_code != 0:
    log(f"Failed to configure preview.cloudfront; output={out}, error={err}'")
    sys.exit(exit_code)

exit_code, out, err = run_command(
    [
        "aws",
        "cloudfront",
        "create-invalidation",
        "--distribution-id",
        distribution_id,
        "--invalidation-batch",
        invalidation,
    ]
)

if exit_code != 0:
    log(f"Failed to create invalidation; output={out}, error={err}'")

sys.exit(exit_code)
