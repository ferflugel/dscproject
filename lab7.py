import numpy

def print_matrix(M_lol):
    M = numpy.array(M_lol)
    print("The matrix is currently:\n")
    print(M)
    print("================================\n")


def get_lead_ind(row):
    for number in row:
        if number != 0:
            return row.index(number)
    return len(row)

def get_row_to_swap(M, start_i):
    minimum = len(M[0]) + 1
    i_minimum = None
    for i in range(start_i, len(M)):
        position = get_lead_ind(M[i])
        if position < minimum:
            minimum = position
            i_minimum = i
    return i_minimum

def add_rows_coefs(r1, c1, r2, c2):
    new_row = []
    for i in range(len(r1)):
        n = r1[i] * c1 + r2[i] * c2
        new_row.append(n)
    return new_row

def eliminate(M, row_to_sub, best_lead_ind):
    for i in range(row_to_sub + 1, len(M)):
        M[i] = add_rows_coefs(M[i], 1, M[row_to_sub], -(M[i][best_lead_ind] / M[row_to_sub][best_lead_ind]))
    return M

def forward_step(M):
    for i in range(len(M)):
        k = get_row_to_swap(M, i)
        M[i], M[k] = M[k], M[i]
        print_matrix(M)
        M = eliminate(M, i, get_lead_ind(M[i]))
        print_matrix(M)
    return M

def eliminate_back(M, row_to_sub, best_lead_ind):
    if row_to_sub > 0:
        for i in range(row_to_sub):
            M[i] = add_rows_coefs(M[i], 1, M[row_to_sub], -(M[i][best_lead_ind] / M[row_to_sub][best_lead_ind]))
    return M

def backward_step(M):
    for i in range(len(M) - 1, -1, -1):
        M = eliminate_back(M, i, get_lead_ind(M[i]))
        print_matrix(M)
    return M

def normalize(M):
    for i in range(len(M)):
        norm = M[i][get_lead_ind(M[i])]
        for j in range(len(M[i])):
            M[i][j] = M[i][j] / norm
    return M

def solve(M, b):
    for i in range(len(M)):
        M[i].append(b[i])
    reduced_normal_form(M)
    x = []
    for i in range(len(M)):
        x.append(M[i][len(M)])
    return x

def reduced_normal_form(M):
    print_matrix(M)
    forward_step(M)
    print_matrix(M)
    backward_step(M)
    print_matrix(M)
    normalize(M)
    print_matrix(M)

M = [[1, -2, 3, 22],
     [3, 10, 1, 314],
     [1, 5, 3, 92]]

A = [[1, 2, 3],
     [3, 5, 10],
     [1, 2, 1]]

test = []
for i in range(len(A)):
    test.append(A[i].copy())

b = [3,
     4,
     1]

reduced_normal_form(M)
result = solve(A, b)

print(f'x = {numpy.array(result)}')

Z = []
for i in range(len(result)):
    Z.append(numpy.matmul(test[i], result))

print(f'Test for b = {numpy.array(Z)}')