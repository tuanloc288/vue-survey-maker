<?php

namespace App\Http\Controllers;

use App\Http\Resources\SurveyAnswerResource;
use App\Http\Resources\SurveyResourceDashboard;
use App\Models\Survey;
use App\Models\SurveyAnswer;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index(Request $req)
    {
        $user = $req->user();

        // Get total number of surveys
        $totalSurveys = Survey::query()->where('user_id', $user->id)->count();

        // Get all surveys
        $allSurveys = Survey::query()
            ->where('user_id', $user->id)
            ->get();

        // Get latest surveys
        $latestSurvey = Survey::query()->where('user_id', $user->id)->latest()->first();

        // Get number of answers
        $totalAnswers = SurveyAnswer::query()
            ->join('surveys', 'survey_answers.survey_id', '=', 'surveys.id')
            ->where('surveys.user_id', $user->id)
            ->count();

        // Get latest 5 answers
        $latestAnswers = SurveyAnswer::query()
            ->join('surveys', 'survey_answers.survey_id', '=', 'surveys.id')
            ->where('surveys.user_id', $user->id)
            ->orderBy('end_date', 'DESC')
            ->getModels('survey_answers.*');

        return [
            'totalSurveys' => $totalSurveys,
            'surveys' => $allSurveys,
            'latestSurvey' => $latestSurvey ? new SurveyResourceDashboard($latestSurvey) : null,
            'totalAnswers' => $totalAnswers,
            'allAnswers' => SurveyAnswerResource::collection($latestAnswers),
        ];
    }
}
