# RandPass: A command-line interface for generating random passwords
# Copyright (C) 2018 U8N WXD <cs.temporary@icloud.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

NAME="archive-branch.sh"

echo "RandPass Copyright (C) 2018 U8N WXD <cs.temporary@icloud.com>"
echo "This program comes with ABSOLUTELY NO WARRANTY"
echo "This is free software, and you are welcome to redistribute it"
echo "under the conditions of the Affero General Public License."
echo "License: <http://www.gnu.org/licenses/>"
echo

if (( $# != 1 )); then {
  echo "ERROR: Need exactly 1 argument, the branch name."
  echo "Usage: $NAME [branch_name]"
  exit 1
}
fi

branch=$1

# SOURCE: https://stackoverflow.com/questions/17790123/shell-script-trying-to-validate-if-a-git-tag-exists-in-a-git-repository-in-an
if git rev-list "archive/$branch".. >/dev/null; then {
  echo "The tag 'archive/$branch' already exists. Aborting archival."
} else {
  # SOURCE: https://stackoverflow.com/questions/21151178/shell-script-to-check-if-specified-git-branch-exists
  if git branch --list $branch; then {
    git tag archive/$branch $branch
    git branch -d $branch
    echo "The branch '$branch' was archived as the tag 'archive/$branch' and deleted."
  } else {
    echo "No branch '$branch' was found to archive. Aborting archival."
  }
  fi
}
fi
