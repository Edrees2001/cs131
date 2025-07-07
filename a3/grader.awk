# grader.awk
# This script reads student grades from a CSV file,
# calculates total and average scores, and prints whether they pass or fail.

BEGIN {
    FS = ","  # Use comma as the field separator
    max_score = -1
    min_score = 1000
}

# Skip the header
NR == 1 {
    next
}

# Define a function to calculate average of 3 grades
function get_average(a, b, c) {
    return (a + b + c) / 3
}

{
    student_id = $1
    name = $2
    grade1 = $3
    grade2 = $4
    grade3 = $5

    total = grade1 + grade2 + grade3
    avg = get_average(grade1, grade2, grade3)

    if (avg >= 70) {
        status = "Pass"
    } else {
        status = "Fail"
    }

    # Store data in arrays
    student_total[name] = total
    student_avg[name] = avg
    student_status[name] = status

    # Track top and lowest scoring students
    if (total > max_score) {
        max_score = total
        top_student = name
    }
    if (total < min_score) {
        min_score = total
        bottom_student = name
    }
}

END {
    print "Student Report"
    print "--------------"

    for (name in student_total) {
        printf "Name: %s | Total: %d | Average: %.2f | Status: %s\n", name, student_total[name], student_avg[name], student_status[name]
    }

    print "\nTop Scoring Student:"
    printf "%s with total score of %d\n", top_student, max_score

    print "\nLowest Scoring Student:"
    printf "%s with total score of %d\n", bottom_student, min_score
}
