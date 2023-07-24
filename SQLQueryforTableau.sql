/*

Queries for Tableau Project

*/

-- Global death percentage, total cases vs total deaths
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as death_percentage
From COVID..CovidDeaths$
Where continent is not null
order by 1,2

-- Total death count by continent
Select location, SUM(cast(new_deaths as int)) as total_death_count
From COVID..CovidDeaths$
Where continent is null
and location not in ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
Group by location
Order by total_death_count desc

-- Highest infection count and percentage by location
Select location, population, MAX(total_cases) as highest_infection_count, MAX(total_cases/population)*100 as population_infected_percentage
From COVID..CovidDeaths$
Group by location, population
Order by population_infected_percentage desc

--
Select location, population, date, MAX(total_cases) as highest_infection_count, MAX(total_cases/population)*100 as population_infected_percentage
From COVID..CovidDeaths$
Group by location, population, date
Order by population_infected_percentage desc