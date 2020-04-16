const db = require('../../modules/database/_db');

const getAdminGroups = async (company_id) => {
    const queryString = 'SELECT * FROM groups WHERE company_id = $1'
    const values = [company_id]
    const adminGroups = await db(queryString, values)
    return adminGroups.rows
}

const getCompanyDetails = async (company_id) => {
    const queryString = 'SELECT * FROM companies WHERE id = $1'
    const values = [Number(company_id)]
    const companyDetails = await db(queryString, values)
    return companyDetails.rows
}

const getGroupDetails = async (group_id) => {
    const queryString = 'SELECT * FROM groups WHERE id = $1'
    const values = [Number(group_id)]
    const groupDetails = await db(queryString, values)
    return groupDetails.rows
}

const getGroupTasks = async (group_id, company_id, accountType) => {
    if(accountType == "admin"){
        queryString = 'SELECT * FROM tasks WHERE company_id = $1 ORDER BY created_at LIMIT 20'
        values = [Number(company_id)]
        const groupTasks = await db(queryString, values)
        return groupTasks.rows
    }else{
        const queryString = 'SELECT* FROM tasks WHERE group_id = $1 ORDER BY created_at LIMIT 20'
        console.log(group_id)
        const values = [Number(group_id)]
        const groupTasks = await db(queryString, values)
        return groupTasks.rows
    }  
}

const getTeamMembers = async (group_id, company_id, accountType) => {
    if(accountType == "admin"){
        const queryString = 'SELECT id, name, email, last_login, profile_picture FROM users WHERE company_id = $1'
        const values = [Number(company_id)]
        const teamMembers = await db(queryString, values)
        return teamMembers.rows
    }else{
        const queryString = 'SELECT id, name, email, last_login, profile_picture FROM users WHERE group_id = $1'
        const values = [group_id]
        const teamMembers = await db(queryString, values)
        return teamMembers.rows
    }
}
    

const getTeamLocations = async (company_id) => {
    const queryString = 'SELECT * FROM locations WHERE company_id = $1'
    const values = [Number(company_id)]
    const teamLocations = await db(queryString, values)
    return teamLocations.rows
}

async function profileController(request, response){
    const group_id = request.decodedToken.group_id 
    const groupDetails = await getGroupDetails(group_id)
    const groupTasks = await getGroupTasks(group_id, request.decodedToken.company_id, request.decodedToken.type)
    const teamMembers = await getTeamMembers(group_id, request.decodedToken.company_id, request.decodedToken.type)
    const teamLocations = await getTeamLocations(request.decodedToken.company_id)
    const companyDetails = await getCompanyDetails(request.decodedToken.company_id)
    if (request.decodedToken.type=="admin"){
        adminGroups = await getAdminGroups(Number(request.decodedToken.company_id))
    }
    else{
        adminGroups = null;
    }

    response.status(200).json({
        id: request.decodedToken.id,
        userEmail : request.decodedToken.email,
        userName : request.decodedToken.name,
        userType : request.decodedToken.type,
        profilePicture : request.decodedToken.profile_picture,
        groupTasks : groupTasks,
        teamMembers : teamMembers,
        locations : teamLocations,
        companyDetails : companyDetails,
        groupDetails : groupDetails,
        adminGroups : adminGroups
    })
}

module.exports = profileController;