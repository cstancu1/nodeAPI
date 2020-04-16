const db = require('../../modules/database/_db');

const getTasks = async (request, response) => {
    perPage = Number(request.params.perpage)
    page = Number(request.params.page)
    sortBy = request.params.sortby
    order = request.params.order
    startIndex = page*perPage-perPage
    var byStatusQuery = ''

    if(request.params.searchterm){
        searchTerm = request.params.searchterm
    }else{
        searchTerm = '%'
    }

    var byStatus = String(request.params.bystatus)
    
    if(byStatus=='finnished')
    {
        byStatusQuery = " AND finnished_time IS NOT NULL";
    }
    else if(byStatus =='assigned')
    {
        byStatusQuery = ' AND finnished_time IS NULL AND assigned_time IS NOT NULL '
    }
    else if(byStatus=='unasigned')
    {
        byStatusQuery = ' AND assigned_time IS NULL AND finnished_time IS NULL';
    }
    else{
        byStatusQuery = ''
    }

    switch(sortBy){
        case 'date': 
            orderTerm = 'created_at';
            break;

        case 'assigned_time': 
            orderTerm = 'assigned_time';
            break;

        case 'finnished_time': 
            orderTerm = 'finnished_time';
            break;
    }
    if(request.decodedToken.type==="admin"){
        queryString = `SELECT * FROM (SELECT * FROM tasks WHERE LOWER(title) LIKE LOWER($4) OR LOWER(text) LIKE LOWER($4)) AS Alias WHERE company_id = $1 ${byStatusQuery} ORDER BY ${orderTerm} ${order} LIMIT $2 OFFSET $3`
        values = [Number(request.decodedToken.company_id), Number(perPage), startIndex , '%'+searchTerm+'%']
        const tasks = await db(queryString, values).catch(err => console.log(err))
        response.status(200).json({tasks:tasks.rows})
    }else{
        const groupId = Number(request.decodedToken.group_id)
        const queryString = `SELECT * FROM (SELECT * FROM tasks WHERE LOWER(title) LIKE LOWER($4) OR LOWER(text) LIKE LOWER($4)) AS Alias WHERE group_id = $1 ${byStatusQuery} ORDER BY ${orderTerm} ${order} LIMIT $2 OFFSET $3`
        values = [Number(groupId), Number(perPage), startIndex, '%'+searchTerm+'%']
        const tasks = await db(queryString, values)
        response.status(200).json({tasks:tasks.rows})
    }  
}

module.exports = getTasks;