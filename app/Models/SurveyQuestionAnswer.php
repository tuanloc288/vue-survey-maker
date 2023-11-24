<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SurveyQuestionAnswer extends Model
{
    use HasFactory;

    protected $fillable = ['survey_question_id', 'survey_answer_id', 'answer'];

    public function surveyAnswer()
    {
        return $this->belongsTo(SurveyAnswer::class);
    }

    public function surveyQuestion()
    {
        return $this->belongsTo(SurveyQuestion::class);
    }
}
