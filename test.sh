#!/bin/bash
CRITICAL_ISSUE_COUNT=`awk '{ print $1 }' critical_issue_count.txt`
TOTAL_ISSUE_COUNT=`awk '{ print $4 }' critical_issue_count.txt`
echo "Criticals: $CRITICAL_ISSUE_COUNT"
echo "Totals: $TOTAL_ISSUE_COUNT"

