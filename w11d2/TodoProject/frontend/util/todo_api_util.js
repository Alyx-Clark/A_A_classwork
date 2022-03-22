

// $.ajax({
//     method: 'GET',
//     url: '/api/todos'
// }).then(
//     todos => console.log(todos),
//     error => console.log(error)
// );


export const getAllTodos = () => {
    return $.ajax({
        method: 'GET',
        url: '/api/todos'
    });
}; // $.ajax returns a promise 

